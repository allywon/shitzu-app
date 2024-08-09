import type { HereCall } from "@here-wallet/core";

import type { Meme } from "$lib/models/memecooking";
import { Ft, refreshNearBalance, wallet } from "$lib/near";
import { FixedNumber } from "$lib/util";
import { getTokenId } from "$lib/util/getTokenId";

export async function handleSwap(
  input: FixedNumber,
  accountId: string,
  expected: FixedNumber,
  meme: Meme,
) {
  if (!input || !accountId) return;
  const tokenId = getTokenId(meme.symbol, meme.meme_id);

  const isRegistered = await Ft.isUserRegistered(tokenId, accountId);

  const min_amount_out = expected
    .mul(new FixedNumber("95", 2))
    .div(new FixedNumber("100", 2))
    .toU128();

  const transactions: HereCall[] = [];

  if (!isRegistered) {
    const deposit = await Ft.storageRequirement(tokenId);
    transactions.push({
      receiverId: tokenId,
      actions: [
        {
          type: "FunctionCall",
          params: {
            methodName: "storage_deposit",
            args: {},
            gas: 20_000_000_000_000n.toString(),
            deposit,
          },
        },
      ],
    });
  }

  transactions.push({
    receiverId: import.meta.env.VITE_WRAP_NEAR_CONTRACT_ID,
    actions: [
      {
        type: "FunctionCall",
        params: {
          methodName: "near_deposit",
          args: {},
          gas: 30_000_000_000_000n.toString(),
          deposit: input.toU128(),
        },
      },
      {
        type: "FunctionCall",
        params: {
          methodName: "ft_transfer_call",
          args: {
            receiver_id: import.meta.env.VITE_REF_CONTRACT_ID,
            amount: input.toU128(),
            msg: JSON.stringify({
              actions: [
                {
                  pool_id: meme.pool_id,
                  token_in: import.meta.env.VITE_WRAP_NEAR_CONTRACT_ID,
                  amount_in: input.toU128(),
                  token_out: tokenId,
                  min_amount_out,
                },
              ],
            }),
          },
          gas: 270_000_000_000_000n.toString(),
          deposit: "1",
        },
      },
    ],
  });

  await wallet.signAndSendTransactions(
    { transactions },
    {
      onSuccess: () => {
        refreshNearBalance(accountId);
      },
      onFinally: () => {},
    },
  );
}

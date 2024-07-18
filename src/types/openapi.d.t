/**
 * This file was auto-generated by openapi-typescript.
 * Do not make direct changes to the file.
 */

export interface paths {
    "/info": {
        parameters: {
            query?: never;
            header?: never;
            path?: never;
            cookie?: never;
        };
        /** @description Returns latest indexed block height */
        get: {
            parameters: {
                query?: never;
                header?: never;
                path?: never;
                cookie?: never;
            };
            requestBody?: never;
            responses: {
                /** @description latest indexed block height */
                200: {
                    headers: {
                        [name: string]: unknown;
                    };
                    content: {
                        "application/json": {
                            lastBlockHeight: number;
                        };
                    };
                };
            };
        };
        put?: never;
        post?: never;
        delete?: never;
        options?: never;
        head?: never;
        patch?: never;
        trace?: never;
    };
    "/meme": {
        parameters: {
            query?: never;
            header?: never;
            path?: never;
            cookie?: never;
        };
        /** @description Returns all meme token launches */
        get: {
            parameters: {
                query?: {
                    order_by?: "meme_id" | "end_timestamp_ms" | "created_blockheight" | "total_deposit_num" | "total_deposit_fees_num" | "total_withdraw_fees_num";
                    order_by_direction?: "asc" | "desc";
                    is_finalized?: boolean | null;
                };
                header?: never;
                path?: never;
                cookie?: never;
            };
            requestBody?: never;
            responses: {
                /** @description meme token launches */
                200: {
                    headers: {
                        [name: string]: unknown;
                    };
                    content: {
                        "application/json": {
                            meme_id: number;
                            owner: string;
                            end_timestamp_ms: number | null;
                            name: string;
                            symbol: string;
                            decimals: number;
                            total_supply?: string | null;
                            reference: string;
                            reference_hash: string;
                            deposit_token_id: string;
                            total_supply_num: number;
                            created_blockheight: number;
                            created_timestamp_ms: number;
                            total_deposit: string;
                            total_deposit_num: number;
                            total_deposit_fees: string;
                            total_deposit_fees_num: number;
                            total_withdraw_fees: string;
                            total_withdraw_fees_num: number;
                            is_finalized?: boolean | null;
                            token_id?: string | null;
                            pool_id?: number | null;
                        }[];
                    };
                };
            };
        };
        put?: never;
        post?: never;
        delete?: never;
        options?: never;
        head?: never;
        patch?: never;
        trace?: never;
    };
    "/deposit": {
        parameters: {
            query?: never;
            header?: never;
            path?: never;
            cookie?: never;
        };
        /** @description Returns all deposits for given meme ID */
        get: {
            parameters: {
                query: {
                    meme_id: string;
                };
                header?: never;
                path?: never;
                cookie?: never;
            };
            requestBody?: never;
            responses: {
                /** @description deposits */
                200: {
                    headers: {
                        [name: string]: unknown;
                    };
                    content: {
                        "application/json": {
                            meme_id: number;
                            account_id: string;
                            amount: string;
                            fee: string;
                            amount_num: number;
                            fee_num: number;
                        }[];
                    };
                };
            };
        };
        put?: never;
        post?: never;
        delete?: never;
        options?: never;
        head?: never;
        patch?: never;
        trace?: never;
    };
    "/withdraw": {
        parameters: {
            query?: never;
            header?: never;
            path?: never;
            cookie?: never;
        };
        /** @description Returns all withdrawals for given meme ID */
        get: {
            parameters: {
                query: {
                    meme_id: string;
                };
                header?: never;
                path?: never;
                cookie?: never;
            };
            requestBody?: never;
            responses: {
                /** @description withdrawals */
                200: {
                    headers: {
                        [name: string]: unknown;
                    };
                    content: {
                        "application/json": {
                            meme_id: number;
                            account_id: string;
                            amount: string;
                            fee: string;
                            amount_num: number;
                            fee_num: number;
                        }[];
                    };
                };
            };
        };
        put?: never;
        post?: never;
        delete?: never;
        options?: never;
        head?: never;
        patch?: never;
        trace?: never;
    };
}
export type webhooks = Record<string, never>;
export interface components {
    schemas: never;
    responses: never;
    parameters: never;
    requestBodies: never;
    headers: never;
    pathItems: never;
}
export type $defs = Record<string, never>;
export type operations = Record<string, never>;

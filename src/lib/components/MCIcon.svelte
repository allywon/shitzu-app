<script lang="ts">
  import type { Meme } from "$lib/api/client";

  export let meme: Pick<Meme, "image" | "name">;

  let className: string = "";
  let imgSrc = `${import.meta.env.VITE_IPFS_GATEWAY}/${meme.image}`;
  $: if (meme.image) {
    imgSrc = `${import.meta.env.VITE_IPFS_GATEWAY}/${meme.image}`;
  }

  export { className as class };
</script>

<img
  src={imgSrc}
  class={className}
  alt={meme.name}
  on:error={() => {
    if (meme.image) {
      imgSrc = meme.image;
    }
  }}
/>

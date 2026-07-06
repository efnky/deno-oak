import { Application } from "@oak/oak";

const app = new Application();

app.use((ctx) => {
  ctx.response.body = `deno-oak up on :${port}\n`;
});

const port = Number(Deno.env.get("PORT") ?? 8000);

console.log(`Listening on :${port}`);
await app.listen({ port });

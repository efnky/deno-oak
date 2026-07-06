FROM denoland/deno:2.1.4 AS runner

WORKDIR /app

COPY deno.json ./
RUN deno install --entrypoint main.ts

COPY . .

EXPOSE 8080

USER deno

CMD ["deno", "run", "--allow-net", "--allow-env", "main.ts"]
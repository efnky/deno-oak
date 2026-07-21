FROM denoland/deno:2.1.4 AS builder

WORKDIR /app

COPY . .

RUN deno install --entrypoint main.ts

FROM denoland/deno:2.1.4 AS runner

WORKDIR /app

COPY --from=builder --chown=deno:deno /deno-dir /deno-dir
COPY . .

EXPOSE 8080

USER deno

CMD ["deno", "run", "--allow-net", "--allow-env", "main.ts"]
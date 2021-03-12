FROM ghcr.io/aserto-dev/calc-version:1.1.3
COPY /entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

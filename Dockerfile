FROM f0rc3/gokapi:latest

# Install gettext for envsubst
RUN apk add --no-cache gettext

# Set the entrypoint script
ENTRYPOINT ["/app/config/entrypoint.sh"]

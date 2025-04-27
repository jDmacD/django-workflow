FROM ghcr.io/astral-sh/uv:bookworm-slim

# Copy the project into the image
ADD . /app

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app
RUN uv python install 3.13 && uv sync --locked
CMD ["uv", "run", "manage.py", "runserver"]
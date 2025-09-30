# Properties → Components → Content → Actions

Actions are **atomic** executable units written in Python.

## Structure
- **Action.py** — the Python implementation.
- **README** — technical documentation of purpose, I/O, examples.
- **requirements.txt** — Python dependencies (pure-Python only; no binary installs in the image).

## Guidelines
- Keep Actions **small** and **single-purpose**.
- Define a clear **input → output** contract.
- Pin dependencies conservatively in `requirements.txt`.

## Testing
- Use **Execute** with small payloads to validate behavior in isolation.
- Save payloads as examples for reproducibility.

!!! warning "Dependencies"
    Only dependencies that do **not** require binary installations are supported in the build image.

# Architecture Decision Records

This directory contains the Architecture Decision Records (ADRs) for this repository.

ADRs document important architectural decisions made during the development
of this project, including their context, the decision that was made, and the
consequences of that decision.

For more information about ADRs see:
https://adr.github.io/

## ADR List
* [1. Record architecture decisions](0001-record-architecture-decisions.md)
* [2. Configure VSCode to trust the Devbox JSON schema domain](0002-configure-vscode-to-trust-the-devbox-json-schema-domain.md)

---

## Contributing

To create a new ADR:

```bash
adr new "Short decision title"
```

After creating a new ADR, regenerate the ADR index:

```bash
adr generate toc \
  -i docs/adr/header.md \
  -o docs/adr/footer.md \
  > docs/adr/index.md
```

*Do not edit the ADR list manually. It is generated using adr-tools.*
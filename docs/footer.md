## Terraform Docs

This repository uses [terraform-docs](https://terraform-docs.io/) to generate module documentation. We use a custom `.terraform-docs.yml` configuration to include a header from `main.tf`, an examples section and a footer from `docs/footer.md`.

To regenerate the documentation use the basic `terraform-docs` command.

```bash
terraform-docs .
```

## ADRs

This repository uses Architecture Decision Records (ADRs) to document important technical and architectural decisions.

- ADR index: [docs/adr/index.md](docs/adr/index.md)
- New ADRs should be created with `adr`
- After creating or updating ADRs, regenerate the index
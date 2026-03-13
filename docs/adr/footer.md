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
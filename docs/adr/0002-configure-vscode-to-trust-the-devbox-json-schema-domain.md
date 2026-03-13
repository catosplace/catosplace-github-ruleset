# 2. Configure VSCode to trust the Devbox JSON schema domain

Date: 2026-03-12

## Status

Accepted

## Context

In this project, VSCode reports warnings or problems related to the Devbox JSON schema used for validation. The issue occurs because VSCode does not automatically trust the remote schema source hosted on `raw.githubusercontent.com`.

To prevent these editor errors, the workspace includes a `.vscode/settings.json` configuration that explicitly marks the Devbox schema URL as trusted:

```json
{
  "json.schemaDownload.trustedDomains": {
    "https://raw.githubusercontent.com/jetify-com/devbox/0.17.0/.schema/devbox.schema.json": true
  }
}
```
This setting allows VSCode to download and use the schema for validation without showing trust-related problems in the editor.

## Decision

We will keep a workspace-level `.vscode/settings.json` file that explicitly trusts the Devbox schema URL hosted on `raw.githubusercontent.com`.

This decision standardizes the development experience across the team by ensuring that contributors using VSCode do not see unnecessary schema download or validation errors for the Devbox configuration.

## Consequences

VSCode users will no longer see trust-related problems for the Devbox schema in this workspace.

The developer experience is improved because JSON validation can work as intended without requiring each contributor to manually adjust local editor trust settings.

This approach also introduces a dependency on a specific remote schema URL and version. If the schema location or Devbox version changes, the trusted domain entry may need to be updated accordingly.

Because this configuration is specific to VSCode, it only affects users of that editor and does not change application runtime behavior.

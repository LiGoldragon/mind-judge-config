# mind-judge-config — architecture

`mind-judge-config` owns public prompt and configuration data for Mind judge
adapters.

Prompts are Markdown files grouped by concern. The repo may add NOTA manifests
for machine selection across multiple Markdown prompts. Prompt data stays out of
Rust binaries so prompt edits do not force Rust or Nix rebuilds of the adapter.

## Boundary

Owned here:

- public prompt prose for Mind judge concerns;
- NOTA manifests that name prompt files and concerns;
- non-secret adapter configuration data.

Not owned here:

- provider credentials or secret values;
- executable adapter code;
- Mind storage logic;
- eval fixtures and result streams, which belong in `mind-tests`.

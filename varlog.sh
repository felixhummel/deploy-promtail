#!/bin/bash
set -euo pipefail

promtail -dry-run -config.file config.yaml

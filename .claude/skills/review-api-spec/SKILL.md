---
name: review-api-spec
description: |
  Review the OpenAPI specification under spec/ from the perspective of an API implementer.
  Use when asked to review or check the API specification.
---

## Steps

1. Run `make lint` to check for violations of the OpenAPI Specification.
2. Starting from `spec/openapi.yaml`, read all files referenced via `$ref` (`spec/paths/`, `spec/components/`).
3. Review the specification from the perspectives below.

## Perspectives

1. Summarize any issues detected by lint.
2. Whether the API specification conforms to the JSON:API Specification v1.1.
3. Whether there are any missing descriptions or inconsistencies from the standpoint of implementing the API.
4. Whether there are any English spelling or grammatical errors.

## Output

- For each finding, provide "File:Line", "Severity (High/Medium/Low)", "Issue", and "Suggested fix".
- Do not modify the specification; only report the review results.
- Write the entire report in user's language, including headings, table headers, issue descriptions, and suggested fixes.
- Keep quoted spec text, identifiers, file paths, and proposed English wording in the spec as-is (in English).

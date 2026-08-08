#!/usr/bin/env python3
"""Convert ExNovo.pdf to Markdown and save to doc/rules/ExNovo.md."""

import os
import sys
import fitz  # PyMuPDF

INPUT_PATH = "assets/.basepdf/ExNovo.pdf"
OUTPUT_DIR = "doc/rules"
OUTPUT_PATH = os.path.join(OUTPUT_DIR, "ExNovo.md")


def main() -> int:
    # 1. Check input file exists
    if not os.path.isfile(INPUT_PATH):
        print(f"ERROR: Input file not found: {INPUT_PATH}", file=sys.stderr)
        return 1

    # 2. Create output directory if needed (idempotent)
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    # 3. Extract text from PDF
    try:
        doc = fitz.open(INPUT_PATH)
    except Exception as e:
        print(f"ERROR: Could not open PDF: {e}", file=sys.stderr)
        return 1

    pages_text = []
    for page in doc:
        pages_text.append(page.get_text())

    doc.close()

    # 4. Write Markdown
    markdown_content = "\n\n".join(pages_text).strip() + "\n"

    with open(OUTPUT_PATH, "w", encoding="utf-8") as f:
        f.write(markdown_content)

    print(f"OK: Converted {len(pages_text)} pages -> {OUTPUT_PATH}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
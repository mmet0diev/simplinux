#!/usr/bin/env python3
import os
import sys

try:
    parentpath = sys.argv[1]
    sitepath   = sys.argv[2]
    filename   = sys.argv[3]
except IndexError:
    print("Usage: setupwebsite.py <parent_path> <site_folder> <base_filename>")
    sys.exit(1)

full_site_path = os.path.join(parentpath, sitepath)

try:
    if not os.path.exists(full_site_path):
        os.makedirs(full_site_path, exist_ok=True)
        print(f"✅ Created folder: {full_site_path}")
    else:
        print(f"ℹ️ Folder already exists: {full_site_path}")

    # HTML
    with open(os.path.join(full_site_path, filename + ".html"), "w", encoding="utf-8") as f:
        f.write(
            "<!-- <!DOCTYPE html> -->\n"
            "<!DOCTYPE html>\n"
            "<html lang=\"en\">\n"
            "<head>\n"
            "    <meta charset=\"UTF-8\">\n"
            "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
            "    <title>Document</title>\n"
            "</head>\n"
            "<body>\n"
            "</body>\n"
            "</html>\n"
        )

    # JS
    with open(os.path.join(full_site_path, filename + ".js"), "w", encoding="utf-8") as f:
        f.write("// JS File\n")

    # CSS
    with open(os.path.join(full_site_path, filename + ".css"), "w", encoding="utf-8") as f:
        f.write("/* CSS File */\n")

    print("✅ Files created.")
except Exception as e:
    print(f"Error: {e}")

name: Build DLL

on:
  push:
    branches: [ main ]
  workflow_dispatch:

jobs:
  build:
    runs-on: windows-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: MSVC environment
        uses: ilammy/msvc-dev-cmd@v1

      - name: Build DLL
        run: |
          cl /nologo /std:c++17 /O2 /EHsc /LD mycheats.cpp /Fe:mycheats.dll ^
             /link user32.lib

      - name: Upload DLL
        uses: actions/upload-artifact@v4
        with:
          name: mycheats-dll
          path: mycheats.dll
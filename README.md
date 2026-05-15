
Simple demonstration using a cmake and a python script to generate godot docs from doxygen XML

Configure:
```cmake -S . -B cmake-build -G Ninja```

Build Docs:
```cmake --build cmake-build --target doc_doxygen```

This should build the doxygen documentation which will then get converted to Godot docs in the doc-classes folder.

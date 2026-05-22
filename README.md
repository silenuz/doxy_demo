IMPORTANT
---------
**Due to some changes today, output is not correct**.  
Monday it will be fixed.

Simple demonstration using a cmake and a python script to generate godot docs from doxygen XML

Configure:
```cmake -S . -B cmake-build -G Ninja```

Build Docs:
```cmake --build cmake-build --target doc_doxygen```

This should build the doxygen documentation which will then get converted to Godot docs in the doc-classes folder.

You can then build the project
```cmake --build cmake-build```

If you open the demo directory in the godot editor and open the example.gd, you should be able to hover over either of the constructors to 
see the documentation for that class.


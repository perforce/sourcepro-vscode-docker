Container Development With Visual Studio Code Extensions, Docker, and SourcePro
===============================================================================

As of Visual Studio Code 1.35.0, the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension can be used to easily develop against seemlessly develop in Docker containers.

To learn more about Remote Development in Visual Studio Code check out [Microsoft's guide](https://code.visualstudio.com/docs/remote/containers).

Setting up the development container
------------------------------------
1. For first time users, follow Microsoft's [getting started instructions](https://code.visualstudio.com/docs/remote/containers#_getting-started).
2. Clone this repository.
3. Set up SourcePro:
    * Download `sourcepro_2018.2_linux_x86-64.run` to the `.devcontainer` folder.
    * Download the appropriate SourcePro `license.key` file and place it into the `.devcontainer` folder.
4. Open the project folder in Visual Studio Code.
5. Press <kbd>F1</kbd> and select the "Remote-Containers: Open Folder in Container..." command.


File & Folder structure
-----------------------

This project contains three main components: `.devcontainer`, `.vscode`, and the root-level files.

### .devcontainer
The `.devcontainer` folder is responsible for setting up Visual Studio Code's integration with Docker.
In this example, we provide a basic `devcontainer.json` which points to the `Dockerfile` in the same directory.
Note that `15s.bsf`, `license.key`, and the installer file are all placed into this directory to simplify the process of using those files during the Docker image setup.

A detailed explination of how to use the `.devcontainer` folder can be found in [Microsoft's guide](https://code.visualstudio.com/docs/remote/containers).


### .vscode
The `.vscode` folder defines all Visual Studio Code specific options. It is worth noting the configurations specified in this directory are unaware of the container they run in. Instead they exist as if Visual Studio code had been run from within the container itself.

For this example we use the folder to specify a debug launch with GDB configuration in `launch.json`
In `tasks.json` we call out the process for building our program. (By invoking `make`)

### Root-level files
This example uses a barebones `main.cpp` and `makefile`.
For more information about building a C++ application in Visual Studio Code, please check [Microsoft's guide](https://code.visualstudio.com/docs/languages/cpp).

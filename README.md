# py-pkgs Visual Studio Code Docker support

Docker support for the open-source [py-pkgs book](https://py-pkgs.org). This repository automatically builds and publishes the image `tbeuzen/py-pkgs-vscode` to DockerHub. The image is intended to be used for development with [Visual Studio Code](https://code.visualstudio.com/) and its [Remote - Containers extension](https://code.visualstudio.com/docs/remote/containers), but can be used in other workflows too.

## Usage

To develop with Docker inside Visual Studio Code, you can consult the Visual Studio Code [official container tutorial](https://code.visualstudio.com/docs/remote/containers-tutorial), or try following the steps below:

1. Install Visual Studio Code from the [official website](https://code.visualstudio.com/).
2. Install and configure Docker Desktop for your operating system following the instructions on the [official website](https://www.docker.com/get-started).
3. Once docker is installed, open a command-line interface and pull the `py-pkgs-vscode` docker image by running the following command:

    ```{prompt} bash \$ auto
    $ docker pull pypkgs/vscode
    ```

4. From Visual Studio Code, open/create the working directory you want to develop in (this can be called anything and located wherever you like on your file system).
5. In Visual Studio Code, open the *Extensions* tab on the Visual Studio Code activity bar and search for the "Remote - Containers" extension in the search bar. Install this extension if it is not already installed.
6. Create a file called *`.devcontainer.json`* in your current working directory (be sure to include the period at the beginning of the file name). This file will tell Visual Studio Code how to run in a Docker container. You can read more about this configuration in the [official documentation](https://code.visualstudio.com/docs/remote/create-dev-container), but for now, a minimal set up requires adding the following content to that file:

    ```json
    {
        "name": "poetry",
        "image": "pypkgs/vscode",
        "extensions": ["ms-python.python"],
    }
    ```

7. Now, open the Visual Studio Code [Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) and search for and select the command "Remote-Containers: Reopen in Container". This command will open Visual Studio Code inside a container made using the `py-pkgs-vscode` Docker image. After Visual Studio Code finishes opening in the container, test that you have access to the three pre-installed pieces of packaging software we need by opening the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal) and trying the following commands:

    ```{prompt} bash \$ auto
    $ poetry --version
    $ conda --version
    $ cookiecutter --version
    ```

8. Your development environment is now set up, and you can work with Visual Studio Code as if everything were running locally on your machine (except now your development environment exists inside a container). If you exit Visual Studio Code, your container will persist, and you can re-open it in the future using the “Remote-Containers: Reopen in Container” command we used in step 7.

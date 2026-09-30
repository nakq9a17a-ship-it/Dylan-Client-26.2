# Dylan Client — Android/Termux one-command build

## Requirements
- Termux on a 64-bit Android device (aarch64 recommended)
- Internet access for Gradle/Fabric/Minecraft dependencies
- Several GB of free storage is recommended

## One command
From the project directory:

    chmod +x build_android.sh && ./build_android.sh

The script:
1. Installs Termux OpenJDK 25.
2. Downloads Gradle 9.1.0.
3. Builds the project.
4. Prints the JAR location under `build/libs/`.

Do NOT use the Windows x64 JDK ZIP with Termux. The script installs the Android/Termux OpenJDK package instead.

If `pkg install openjdk-25` is unavailable, update Termux from a current official Termux distribution/repository and run the command again.

# Dylan Client — Gradle project

This source has been converted to a standard Fabric/Loom Gradle project.

## Build

Requirements:
- JDK 25
- Gradle 8.x/compatible with Fabric Loom
- Internet access on first build so Gradle can download Minecraft, mappings, Fabric Loader and Fabric API.

Run:

    gradle build

The remapped Minecraft mod JAR will be under `build/libs/`.

## Android / MJLauncher

MJLauncher does not compile Gradle projects itself. Build the JAR on a PC/Termux environment with JDK 25, then copy the resulting JAR into the launcher mods directory.

The main-menu background removal is preserved in the source; no module list was intentionally changed by this Gradle conversion.

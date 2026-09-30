#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "=== Dylan Client Android/Termux Builder ==="

pkg update -y
pkg install -y openjdk-25 wget unzip git

export JAVA_HOME="$PREFIX/lib/jvm/java-25-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

echo "[1/4] Java:"
java -version

GRADLE_VERSION="9.1.0"
GRADLE_HOME="$HOME/.dylan-gradle/$GRADLE_VERSION"
GRADLE_ZIP="$HOME/.dylan-gradle/gradle-${GRADLE_VERSION}-bin.zip"

if [ ! -x "$GRADLE_HOME/bin/gradle" ]; then
  mkdir -p "$HOME/.dylan-gradle"
  echo "[2/4] Downloading Gradle $GRADLE_VERSION..."
  wget -c -O "$GRADLE_ZIP" \
    "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip"
  rm -rf "$GRADLE_HOME.tmp"
  mkdir -p "$GRADLE_HOME.tmp"
  unzip -q "$GRADLE_ZIP" -d "$GRADLE_HOME.tmp"
  mv "$GRADLE_HOME.tmp/gradle-${GRADLE_VERSION}" "$GRADLE_HOME"
  rm -rf "$GRADLE_HOME.tmp"
fi

export PATH="$GRADLE_HOME/bin:$PATH"

echo "[3/4] Gradle:"
gradle --version

echo "[4/4] Building Dylan Client..."
gradle --no-daemon --stacktrace build

echo
echo "=== BUILD FINISHED ==="
echo "JAR files:"
find build/libs -maxdepth 1 -type f -name "*.jar" -print

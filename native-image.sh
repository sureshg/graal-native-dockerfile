# Builds the Graal Native Image
set -eu

javac src/Main.java -d .

native-image \
  --verbose \
  --no-server \
  --no-fallback \
  --static \
  --enable-http \
  --enable-https \
  --enable-all-security-services \
  -H:+ReportExceptionStackTraces \
  -H:+StackTrace \
  -H:+JNI \
  -H:Name=sample-app \
  -cp . \
  Main

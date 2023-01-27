FROM debian:stable

ARG USERNAME=user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
  #
  # Install sudo, C/C++ build tools, curl, git, and python
  && apt-get update \
  && apt-get install -y sudo build-essential curl git python3 make g++ \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
  && chmod 0440 /etc/sudoers.d/$USERNAME

# Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# Copy entrypoint to users home dir
WORKDIR /home/$USERNAME
COPY --chown=$USERNAME:$USERNAME ./container-scripts/* .

# Start entrypoint script as regular user
CMD ["./entrypoint.sh"]

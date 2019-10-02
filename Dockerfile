################################################################################
# https://github.com/Fongshway/docker-python/blob/master/Dockerfile
FROM fongshway/pipenv:master
################################################################################
ENV PROJECT_DIR="/opt/ansible" \
    PYTHONPATH="${PYTHONPATH}:${PROJECT_DIR}" \
    USER=ansible

# -- Create non-root user:
RUN useradd -ms /bin/bash ${USER} && \
    mkdir -p "${PROJECT_DIR}" && \
    chown -R ${USER}: "${PROJECT_DIR}" /usr/local /home/${USER} && \
    usermod -aG sudo ${USER} && \
    sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

# -- Create application directory:
RUN set -ex && mkdir -p ${PROJECT_DIR}
WORKDIR "${PROJECT_DIR}"

USER ${USER}

COPY . "$PROJECT_DIR"

RUN sudo chown -R ${USER}: "${PROJECT_DIR}"

FROM mcr.microsoft.com/oryx/build:20191105.2

ARG DOTNET_SDK_VER="3.1.100-preview2-014569"
ARG DEFAULT_DOTNET_SDK_URL="https://dotnetcli.blob.core.windows.net/dotnet/Sdk/${DOTNET_SDK_VER}/dotnet-sdk-${DOTNET_SDK_VER}-linux-x64.tar.gz"
ARG DOTNET_SDK_SHA="8c7b68efcf67cb365d79bf4481c7639305e158c1a7feb7fc88fd601e2200619fb43897603f4c4eb06b30f97b4cdb992e86bc85d03369a3bef55445ba1d200ba1"
ARG SDK_DIR="/opt/dotnet/sdks"
ARG DOTNET_DIR="${SDK_DIR}/${DOTNET_SDK_VER}"
ARG DOWNLOAD_DIR="/tmp/dotnet-3.1"
RUN mkdir -p ${DOWNLOAD_DIR} \
    && curl -SL ${DOTNET_SDK_URL} --output ${DOWNLOAD_DIR}/dotnet.tar.gz \
    && echo "${DOTNET_SDK_SHA} ${DOWNLOAD_DIR}/dotnet.tar.gz" | sha512sum -c - \
    && tar -xzf ${DOWNLOAD_DIR}/dotnet.tar.gz -C ${DOTNET_DIR} \
    && rm -rf ${DOWNLOAD_DIR} \
    && ln -s ${DOTNET_SDK_VER} ${SDK_DIR}/3.1 \
    && rm -f ${SDK_DIR}/3 \
    && ln -s ${DOTNET_SDK_VER} ${SDK_DIR}/3

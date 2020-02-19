// --------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT license.
// --------------------------------------------------------------------------------------------

using System.Net.Http;

namespace Microsoft.Oryx.BuildScriptGenerator.Node
{
    internal class NodeSdkStorageVersionProvider : SdkStorageVersionProviderBase, INodeVersionProvider
    {
        public NodeSdkStorageVersionProvider(IEnvironment environment, IHttpClientFactory httpClientFactory)
            : base(environment, httpClientFactory)
        {
        }

        // To enable unit testing
        public virtual PlatformVersionInfo GetVersionInfo()
        {
            return GetAvailableVersionsFromStorage(
                platformName: "nodejs",
                versionMetadataElementName: "version");
        }
    }
}
<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="MySite" generation="1" functional="0" release="0" Id="5587f1c1-419b-47b8-81a0-e0c959d20af9" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="MySiteGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/MySite/MySiteGroup/LB:Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/MySite/MySiteGroup/MapWeb:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/MySite/MySiteGroup/MapWebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/MySite/MySiteGroup/Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapWeb:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/MySite/MySiteGroup/Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapWebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/MySite/MySiteGroup/WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Web" generation="1" functional="0" release="0" software="D:\Rafael.Staib\Documents\GitHub\rstaib.github.io\new site\MySite\csx\Debug\roles\Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/MySite/MySiteGroup/WebInstances" />
            <sCSPolicyUpdateDomainMoniker name="/MySite/MySiteGroup/WebUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/MySite/MySiteGroup/WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WebUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="618a2aca-6196-4bf7-a985-447c15ec554b" ref="Microsoft.RedDog.Contract\ServiceContract\MySiteContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="c6162422-a618-4f02-8da8-f44226f02a8e" ref="Microsoft.RedDog.Contract\Interface\Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/MySite/MySiteGroup/Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>
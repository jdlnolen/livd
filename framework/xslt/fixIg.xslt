<?xml version="1.0" encoding="UTF-8"?>
<!--
  - Strip off schema declaration and unofficial extension
  -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://hl7.org/fhir" xmlns:f="http://hl7.org/fhir" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xsi xs f">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
  <xsl:template match="/">
    <xsl:comment>DO NOT EDIT THIS FILE - It is generated and any changes made here will be overwritten</xsl:comment>
    <xsl:apply-templates select="*"/>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="@xsi:schemaLocation|f:extension[@url=('http://hl7.org/fhir/tools-profile-spreadsheet')]"/>
  <xsl:template match="f:resource[f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()]]"/>
  <xsl:template match="f:resource">
    <xsl:if test="not(f:extension[@url='http://hl7.org/fhir/StructureDefinition/implementationguide-spreadsheet-profile' and f:valueBoolean/@value=true()])">
      <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template match="f:page[*[self::f:source or self::f:nameUrl]/@value='artifacts.html']">
    <xsl:variable name="name">
      <xsl:choose>
        <xsl:when test="f:name">name</xsl:when>
        <xsl:otherwise>title</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:copy>
      <xsl:apply-templates select="@*|node()[not(self::f:page)]"/>
      <xsl:if test="not(f:page[f:format/@value='generated'])">
        <xsl:copy-of select="f:page"/>
        <xsl:for-each select="ancestor::f:ImplementationGuide/f:package/f:resource|ancestor::f:ImplementationGuide/f:definition/f:resource">
          <page>
            <xsl:variable name="type" select="substring-before(*[self::f:sourceReference or self::f:reference]/f:reference/@value, '/')"/>
            <xsl:variable name="id" select="substring-after(*[self::f:sourceReference or self::f:reference]/f:reference/@value, '/')"/>
            <xsl:variable name="value">
              <xsl:choose>
                <xsl:when test="starts-with($id, 'ext-') or contains(f:package/@value, 'xtension')">
                  <xsl:value-of select="concat('extension-', $id, '.html')"/>
                </xsl:when>
                <xsl:when test="$type='ValueSet' and not(f:example/@value='true' or f:exampleBoolean/@value='true' or f:exampleReference or f:exampleCanonical or f:purpose/@value='example')">
                  <xsl:value-of select="concat('valueset-', $id, '.html')"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="concat($id, '.html')"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:choose>
              <xsl:when test="source">
                <source value="{$value}"/>
              </xsl:when>
              <xsl:otherwise>
                <nameUrl value="{$value}"/>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:element name="{$name}" namespace="http://hl7.org/fhir">
              <xsl:attribute name="value">
                <xsl:value-of select="f:name/@value"/>
              </xsl:attribute>
            </xsl:element>
            <xsl:choose>
              <xsl:when test="@kind and ($type='Conformance' or $type='CapabilityStatement' or $type='SearchParameter' or contains($id, 'example'))">
                <kind value="example"/>
              </xsl:when>
              <xsl:when test="@kind">
                <kind value="resource"/>
              </xsl:when>
            </xsl:choose>
            <xsl:if test="@kind">
              <xsl:choose>
                <xsl:when test="$type='Conformance' or $type='SearchParameter'">
                  <format value="generated-resource"/>
                </xsl:when>
                <xsl:otherwise>
                  <format value="generated"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
            <xsl:if test="not(@kind)">
              <generation value="generated"/>
<!--              <extension url="http://hl7.org/fhir/StructureDefinition/implementationguide-page-generated">
                <valueBoolean value="true"/>
              </extension>-->
            </xsl:if>
          </page>
        </xsl:for-each>
      </xsl:if>
    </xsl:copy>
  </xsl:template>  
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:yin="urn:ietf:params:xml:ns:yang:yin:1">
  <xsl:output method="text"/>
  <xsl:strip-space elements="*"/>
  <!-- Extract only descriptive text -->
  <xsl:template match="/">
    <xsl:apply-templates select="//yin:text"/>
  </xsl:template>
  <xsl:template match="yin:text">
    <xsl:value-of select="."/>
    <xsl:text>&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs tei" version="2.0">
    
    <xsl:output omit-xml-declaration="yes" method="text" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:TEI">
        <xsl:text>Transaction Category</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Transaction Date</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Transaction Type</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Recipient</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Payer</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Amount (debit)</xsl:text>
        <xsl:text>,</xsl:text>
        <xsl:text>Amount (credit)</xsl:text>
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="tei:text"/>
    </xsl:template>
    
    <xsl:template match="tei:event">
        <xsl:value-of select="substring-after(@ana, '#')"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="normalize-space(@when)"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="@type"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="normalize-space(tei:desc/tei:persName[@ref='#recipient'])"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="normalize-space(tei:desc/tei:persName[@ref='#payer'])"/>
        <xsl:text>,</xsl:text>
        <xsl:if test="@type='debit'">
                <xsl:value-of select="normalize-space(tei:desc/tei:measure/@n)"/>
            </xsl:if>
        <xsl:text>,</xsl:text>
        <xsl:if test="@type='credit'">
            <xsl:value-of select="normalize-space(tei:desc/tei:measure/@n)"/>
        </xsl:if>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>
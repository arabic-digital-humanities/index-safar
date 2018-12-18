<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output encoding="utf-8" method="html" omit-xml-declaration="yes" />
    <xsl:param name="source_images" select="''"/>

    <xsl:template match="error">
        <h1>Error</h1>
        <xsl:value-of select="message" />
        (Error code: <xsl:value-of select="code" />)
    </xsl:template>
    
    <xsl:template match="//metadata">
	    <xsl:for-each select="//meta">
			    	<xsl:value-of select="@name"/>: <xsl:apply-templates/><br/>
		<xsl:text> </xsl:text>
	    </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="//morphology_analysis">
        <xsl:for-each select="//word">
        <xsl:variable name="roots" select="analysis[not(@root=preceding-sibling::analysis/@root)]/@root" />
		    <span class="word" ref="tooltip">
			    <xsl:attribute name="title">
	                <xsl:value-of select="$roots"/>
	            </xsl:attribute>
		    	<xsl:value-of select="@value"/>
		    </span>
		    <xsl:text> </xsl:text>
    	</xsl:for-each>
    </xsl:template>

<!--     <xsl:template match="//word">
    	<xsl:variable name="roots" select="analysis[not(@root=preceding-sibling::analysis/@root)]/@root" />
    	<xsl:variable name="stems" select="analysis[not(@stem=preceding-sibling::analysis/@stem)]/@stem" />
    	<span class="word" ref="tooltip">
            <xsl:attribute name="title">
                <xsl:value-of select="$roots" />
                <xsl:text>root</xsl:text>
            </xsl:attribute>
            <xsl:value-of select="@value" />
        </span>
    	<xsl:text> </xsl:text>
    	<xsl:for-each select="analysis[not(@root=preceding-sibling::analysis/@root)]/@root">
    		root
    		<xsl:value-of select="@value"/>
        </xsl:for-each>
    </xsl:template> -->

</xsl:stylesheet>
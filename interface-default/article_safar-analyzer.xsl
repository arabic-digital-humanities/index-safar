<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output encoding="utf-8" method="html" omit-xml-declaration="yes" />
    <xsl:param name="source_images" select="''"/>

    <xsl:template match="error">
        <h1>Error</h1>
        <xsl:value-of select="message" />
        (Error code: <xsl:value-of select="code" />)
    </xsl:template>
    
    <xsl:template match="morphology_analysis">
        <div class="col-xs-12 contentbox">
            <ul class="nav nav-tabs" id="articletabs">
                <li class="active">
                    <a href="#text" data-toggle="tab">Text</a>
                </li>
                <xsl:if test="$source_images != ''">
                <li>
                    <a href="#images" data-toggle="tab">Images</a>
                </li>
                </xsl:if>
            </ul>
            
            <div class="tab-content">
                <div class="tab-pane active" id="text">
                    <xsl:apply-templates />
                </div>
                <xsl:if test="$source_images != ''">
               <!--  <div class="tab-pane" id="images">
                    <xsl:for-each select="//interpGrp[@type='images']|//folia:interpGrp[@type='images']">
                        <xsl:for-each select=".//interp|.//folia:interp">
                            <img class="img-polaroid"><xsl:attribute name="src"><xsl:value-of select="$source_images"/><xsl:value-of select="@value"/></xsl:attribute></img>
                            <br/>
                        </xsl:for-each>
                    </xsl:for-each>
                </div>  -->
                </xsl:if>
            </div>          
        </div>
    </xsl:template>
    
    <xsl:template match="word">
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
    </xsl:template>

</xsl:stylesheet>
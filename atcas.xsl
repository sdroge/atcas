<?xml version="1.0" encoding="UTF-8"?>
<!--The line above is a processing instruction telling the computer that this is an XML file.-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    <!-- Only inside an xpath expression do you actually use XSLT in an XML file -->
    <!--What is this element? What are each of the four attributes doing? -->
    <xsl:output method="xhtml" indent="yes" encoding="utf-8"/>
    <!-- This line is saying that the output file will be xhtml and that the lines will wrap for easier reading -->

    <!-- Master Recipe! -->
    <!-- FRAMEWORK TEMPLATE. THIS ORGANIZES THE BASIC STRUCTURE 
    OF THE OUTPUT DOCUMENT. IT IS GOING TO INSERT CONTENT INTO BASIC STRUCTURAL
    TAGS AND INDICATE WHERE MOST PULLED/REARRANGED INFORMATION SHOULD GO.-->

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="atcas.css"/>
                <!-- Eventually we will put the reference to the CSS file here -->
            </head>
            <body>
                <!--  <xsl:call-template name=""></xsl:call-template>-->
                <xsl:apply-templates/>
                <!-- Try using an XPath selection on apply-templates. -->
            </body>
        </html>
    </xsl:template>

    <xsl:template match="div">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="head">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>

    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="lb">
        <br>
            <xsl:apply-templates/>
        </br>
    </xsl:template>

    <xsl:template match="pb">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat('images/', @facs)"/>
            </xsl:attribute>
            <xsl:attribute name="width">
                <xsl:value-of select="'400'"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="note[@type = 'editorial']">
        <span class="ednote">NOTE<span class="ednotetext"><xsl:apply-templates/></span></span>
    </xsl:template>
    
    

</xsl:stylesheet>

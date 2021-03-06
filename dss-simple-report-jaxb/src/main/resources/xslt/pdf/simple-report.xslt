<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:dss="http://dss.esig.europa.eu/validation/simple-report">
	<xsl:output method="xml" indent="yes" />

	<xsl:template match="/dss:SimpleReport">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master>
					<xsl:attribute name="master-name">A4-portrait</xsl:attribute>
					<xsl:attribute name="page-height">29.7cm</xsl:attribute>
					<xsl:attribute name="page-width">21cm</xsl:attribute>
					<xsl:attribute name="margin-top">1cm</xsl:attribute>
					<xsl:attribute name="margin-bottom">1cm</xsl:attribute>
					<xsl:attribute name="margin-right">2.5cm</xsl:attribute>
					<xsl:attribute name="margin-left">2.5cm</xsl:attribute>
			
					<fo:region-body>
						<xsl:attribute name="margin-top">1cm</xsl:attribute>
						<xsl:attribute name="margin-bottom">2cm</xsl:attribute>
					</fo:region-body>

					<fo:region-after>
						<xsl:attribute name="region-name">page-footer</xsl:attribute>
						<xsl:attribute name="extent">1.5cm</xsl:attribute>
					</fo:region-after>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<fo:bookmark-tree>
				<fo:bookmark>
					<xsl:attribute name="internal-destination">policy</xsl:attribute>
					<fo:bookmark-title>Validation Policy</fo:bookmark-title>
				</fo:bookmark>
				
				<xsl:for-each select="//dss:Signature">
					<xsl:variable name="index"><xsl:value-of select="count(preceding-sibling::dss:Signature) + 1" /></xsl:variable>
					<fo:bookmark>
						<xsl:attribute name="internal-destination">signature<xsl:value-of select="$index" /></xsl:attribute>
						<fo:bookmark-title>Signature <xsl:value-of select="$index" /></fo:bookmark-title>
					</fo:bookmark>
				</xsl:for-each>
				
				<fo:bookmark>
					<xsl:attribute name="internal-destination">docInfo</xsl:attribute>
					<fo:bookmark-title>Document Information</fo:bookmark-title>
				</fo:bookmark>
			</fo:bookmark-tree>

			<fo:page-sequence>
				<xsl:attribute name="master-reference">A4-portrait</xsl:attribute>
	
				<fo:static-content>
					<xsl:attribute name="flow-name">page-footer</xsl:attribute>
					<xsl:attribute name="font-size">8pt</xsl:attribute>
					
					<fo:block>
						<xsl:attribute name="color">grey</xsl:attribute>
						<xsl:attribute name="border-top-style">solid</xsl:attribute>
						<xsl:attribute name="border-top-color">grey</xsl:attribute>
						<xsl:attribute name="text-align-last">justify</xsl:attribute>
					
						<fo:inline>
							 <fo:basic-link>
							 	<xsl:attribute name="external-destination">url('https://github.com/esig/dss')</xsl:attribute>
							 	Generated by DSS
							 </fo:basic-link>
						</fo:inline>
						
						<fo:leader/>

						<fo:inline>
							<fo:page-number />
							/
							<fo:page-number-citation>
								<xsl:attribute name="ref-id">theEnd</xsl:attribute>
							</fo:page-number-citation> 
						</fo:inline>
					</fo:block>
				</fo:static-content>

				<fo:flow>
					<xsl:attribute name="flow-name">xsl-region-body</xsl:attribute>
					<xsl:attribute name="font-size">9pt</xsl:attribute>
					
					<xsl:apply-templates />
					
	    			<xsl:call-template name="documentInformation"/>
	    			
					<fo:block>
						<xsl:attribute name="id">theEnd</xsl:attribute>
					</fo:block>
				</fo:flow>
				
			</fo:page-sequence>

		</fo:root>
		
	</xsl:template>
	
    <xsl:template match="dss:DocumentName"/>
    <xsl:template match="dss:SignatureFormat"/>
    <xsl:template match="dss:SignaturesCount"/>
    <xsl:template match="dss:ValidSignaturesCount"/>
    <xsl:template match="dss:ValidationTime"/>
    <xsl:template match="dss:ContainerType"/>
    
    <xsl:template match="dss:Policy">
    	<fo:block>
    		<xsl:attribute name="id">policy</xsl:attribute>
			<xsl:attribute name="font-weight">bold</xsl:attribute>
       		<xsl:attribute name="background-color">#0066CC</xsl:attribute>
       		<xsl:attribute name="color">white</xsl:attribute>
       		<xsl:attribute name="padding">5px</xsl:attribute>
       		<xsl:attribute name="margin-bottom">5px</xsl:attribute>
    		Validation Policy : <xsl:value-of select="dss:PolicyName"/>
    	</fo:block>
    	<fo:block>
       		<xsl:value-of select="dss:PolicyDescription"/>
    	</fo:block>
    </xsl:template>
    
    <xsl:template match="dss:Signature">
    	<xsl:variable name="counter">
    		<xsl:value-of select="count(preceding-sibling::dss:Signature) + 1" />
    	</xsl:variable>
    
        <xsl:variable name="indicationText" select="dss:Indication/text()"/>
        <xsl:variable name="idSig" select="@Id" />
        <xsl:variable name="indicationColor">
        	<xsl:choose>
				<xsl:when test="$indicationText='TOTAL_PASSED'">green</xsl:when>
				<xsl:when test="$indicationText='INDETERMINATE'">orange</xsl:when>
				<xsl:when test="$indicationText='TOTAL_FAILED'">red</xsl:when>
			</xsl:choose>
        </xsl:variable>
        
		<fo:block>
    		<xsl:attribute name="id">signature<xsl:value-of select="$counter" /></xsl:attribute>
			<xsl:attribute name="keep-with-next">always</xsl:attribute>
       		<xsl:attribute name="font-weight">bold</xsl:attribute>
       		<xsl:attribute name="margin-top">15px</xsl:attribute>
       		<xsl:attribute name="margin-bottom">5px</xsl:attribute>
       		<xsl:attribute name="background-color"><xsl:value-of select="$indicationColor" /></xsl:attribute>
       		<xsl:attribute name="color">white</xsl:attribute>
       		<xsl:attribute name="padding">5px</xsl:attribute>
       		Signature <xsl:value-of select="$idSig" />
       	</fo:block>

		<fo:table>
			<xsl:attribute name="page-break-inside">avoid</xsl:attribute>
			
			<fo:table-column>
				<xsl:attribute name="column-width">25%</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width">75%</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
			
			    <xsl:apply-templates select="dss:Filename" />
			
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							Signature Level : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
							<xsl:value-of select="dss:SignatureLevel" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							Indication : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
	       					<xsl:attribute name="color"><xsl:value-of select="$indicationColor" /></xsl:attribute>
	       					<xsl:variable name="subIndication"><xsl:value-of select="dss:SubIndication" /></xsl:variable>
							<xsl:value-of select="dss:Indication" /> <xsl:if test="$subIndication != ''">- <xsl:value-of select="dss:SubIndication" /></xsl:if>
						</fo:block>
						
					    <xsl:apply-templates select="dss:Errors" />
					    <xsl:apply-templates select="dss:Warnings" />
				        <xsl:apply-templates select="dss:Infos" />
						
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							Signature Format : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
							<xsl:value-of select="@SignatureFormat" />
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
  							<xsl:attribute name="font-weight">bold</xsl:attribute>
							Certificate chain:
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<xsl:choose>
				            <xsl:when test="dss:CertificateChain">
					            <xsl:for-each select="dss:CertificateChain/dss:Certificate">
					        		<fo:block>
					        			<xsl:value-of select="dss:qualifiedName" />
					        		</fo:block>	
					        	</xsl:for-each>
				        	</xsl:when>
				        	<xsl:otherwise>
				        		<fo:block>/</fo:block>
				        	</xsl:otherwise>
			        	</xsl:choose>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							On claimed time : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
							<xsl:value-of select="dss:SigningTime"/>
						</fo:block>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
							The validation of the signature, of its supporting certificates and of the related certification path has been performed from this reference time.
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							Signature position : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
							<xsl:value-of select="$counter" /> out of <xsl:value-of select="count(ancestor::*/dss:Signature)"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			
				<xsl:for-each select="dss:SignatureScope">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       							<xsl:attribute name="font-weight">bold</xsl:attribute>
								Signature scope:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:attribute name="padding-bottom">3px</xsl:attribute>
								<xsl:value-of select="@name" />	(<xsl:value-of select="@scope" />)
							</fo:block>
							<fo:block>
								<xsl:attribute name="padding-bottom">3px</xsl:attribute>
								<xsl:value-of select="." />
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</xsl:for-each>
				
			</fo:table-body>	
		</fo:table>

    </xsl:template>
    
    
	<xsl:template match="dss:Errors|dss:Warnings|dss:Infos">
	    <fo:block>
			<xsl:attribute name="padding-bottom">3px</xsl:attribute>
			<xsl:value-of select="." />
		</fo:block>
	</xsl:template>
	
	<xsl:template match="dss:Filename">
		<fo:table-row>
			<fo:table-cell>
				<fo:block>
					<xsl:attribute name="padding-bottom">3px</xsl:attribute>
					<xsl:attribute name="font-weight">bold</xsl:attribute>
					Signature Filename : 
				</fo:block>
			</fo:table-cell>
			<fo:table-cell>
				<fo:block>
					<xsl:attribute name="padding-bottom">3px</xsl:attribute>
					<xsl:value-of select="." />
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
    
    <xsl:template name="documentInformation">
    	<fo:block>
    		<xsl:attribute name="id">docInfo</xsl:attribute>
			<xsl:attribute name="keep-with-next">always</xsl:attribute>
			<xsl:attribute name="font-weight">bold</xsl:attribute>
       		<xsl:attribute name="background-color">#0066CC</xsl:attribute>
       		<xsl:attribute name="color">white</xsl:attribute>
       		<xsl:attribute name="padding">5px</xsl:attribute>
       		<xsl:attribute name="margin-top">15px</xsl:attribute>
       		<xsl:attribute name="margin-bottom">5px</xsl:attribute>
       		Document Information
       	</fo:block>
		<fo:table>
			<xsl:attribute name="page-break-inside">avoid</xsl:attribute>
			<fo:table-column>
				<xsl:attribute name="column-width">25%</xsl:attribute>
			</fo:table-column>
			<fo:table-column>
				<xsl:attribute name="column-width">75%</xsl:attribute>
			</fo:table-column>
			<fo:table-body>
			
				<xsl:if test="dss:ContainerType">
					<fo:table-row>
						<fo:table-cell>
							<fo:block>
								<xsl:attribute name="padding-bottom">3px</xsl:attribute>
								<xsl:attribute name="font-weight">bold</xsl:attribute>
									Container type:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
								<xsl:attribute name="padding-bottom">3px</xsl:attribute>
								<xsl:value-of select="dss:ContainerType"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
		        </xsl:if>
			
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
       						<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							Signatures status : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
	       					<xsl:value-of select="dss:ValidSignaturesCount"/> valid signatures, out of <xsl:value-of select="dss:SignaturesCount"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
       						<xsl:attribute name="font-weight">bold</xsl:attribute>
							Document name : 
						</fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block>
							<xsl:attribute name="padding-bottom">3px</xsl:attribute>
							<xsl:value-of select="dss:DocumentName"/>
						</fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
	</xsl:template>
	
</xsl:stylesheet>
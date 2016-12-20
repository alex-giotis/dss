//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.7 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.12.20 at 08:08:12 AM CET 
//


package eu.europa.esig.dss.jaxb.diagnostic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * <p>Java class for TrustedServiceProvider complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="TrustedServiceProvider">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="TSPName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="TSPServiceName" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="TSPServiceType" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="Status" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element name="StartDate" type="{http://www.w3.org/2001/XMLSchema}dateTime"/>
 *         &lt;element name="EndDate" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *         &lt;element name="Qualifiers" minOccurs="0">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="Qualifier" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded"/>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="AdditionalServiceInfoUris" minOccurs="0">
 *           &lt;complexType>
 *             &lt;complexContent>
 *               &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *                 &lt;sequence>
 *                   &lt;element name="URI" type="{http://www.w3.org/2001/XMLSchema}string" maxOccurs="unbounded"/>
 *                 &lt;/sequence>
 *               &lt;/restriction>
 *             &lt;/complexContent>
 *           &lt;/complexType>
 *         &lt;/element>
 *         &lt;element name="expiredCertsRevocationInfo" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *         &lt;element name="WellSigned" type="{http://www.w3.org/2001/XMLSchema}boolean"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "TrustedServiceProvider", propOrder = {
    "tspName",
    "tspServiceName",
    "tspServiceType",
    "status",
    "startDate",
    "endDate",
    "qualifiers",
    "additionalServiceInfoUris",
    "expiredCertsRevocationInfo",
    "wellSigned"
})
public class XmlTrustedServiceProvider {

    @XmlElement(name = "TSPName", required = true)
    protected String tspName;
    @XmlElement(name = "TSPServiceName", required = true)
    protected String tspServiceName;
    @XmlElement(name = "TSPServiceType", required = true)
    protected String tspServiceType;
    @XmlElement(name = "Status", required = true)
    protected String status;
    @XmlElement(name = "StartDate", required = true, type = String.class)
    @XmlJavaTypeAdapter(Adapter1 .class)
    @XmlSchemaType(name = "dateTime")
    protected Date startDate;
    @XmlElement(name = "EndDate", type = String.class)
    @XmlJavaTypeAdapter(Adapter1 .class)
    @XmlSchemaType(name = "dateTime")
    protected Date endDate;
    @XmlElementWrapper(name = "Qualifiers")
    @XmlElement(name = "Qualifier", namespace = "http://dss.esig.europa.eu/validation/diagnostic")
    protected List<String> qualifiers;
    @XmlElementWrapper(name = "AdditionalServiceInfoUris")
    @XmlElement(name = "URI", namespace = "http://dss.esig.europa.eu/validation/diagnostic")
    protected List<String> additionalServiceInfoUris;
    @XmlElement(type = String.class)
    @XmlJavaTypeAdapter(Adapter1 .class)
    @XmlSchemaType(name = "dateTime")
    protected Date expiredCertsRevocationInfo;
    @XmlElement(name = "WellSigned")
    protected boolean wellSigned;

    /**
     * Gets the value of the tspName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTSPName() {
        return tspName;
    }

    /**
     * Sets the value of the tspName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTSPName(String value) {
        this.tspName = value;
    }

    /**
     * Gets the value of the tspServiceName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTSPServiceName() {
        return tspServiceName;
    }

    /**
     * Sets the value of the tspServiceName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTSPServiceName(String value) {
        this.tspServiceName = value;
    }

    /**
     * Gets the value of the tspServiceType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getTSPServiceType() {
        return tspServiceType;
    }

    /**
     * Sets the value of the tspServiceType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setTSPServiceType(String value) {
        this.tspServiceType = value;
    }

    /**
     * Gets the value of the status property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getStatus() {
        return status;
    }

    /**
     * Sets the value of the status property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStatus(String value) {
        this.status = value;
    }

    /**
     * Gets the value of the startDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public Date getStartDate() {
        return startDate;
    }

    /**
     * Sets the value of the startDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setStartDate(Date value) {
        this.startDate = value;
    }

    /**
     * Gets the value of the endDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public Date getEndDate() {
        return endDate;
    }

    /**
     * Sets the value of the endDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setEndDate(Date value) {
        this.endDate = value;
    }

    /**
     * Gets the value of the expiredCertsRevocationInfo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public Date getExpiredCertsRevocationInfo() {
        return expiredCertsRevocationInfo;
    }

    /**
     * Sets the value of the expiredCertsRevocationInfo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setExpiredCertsRevocationInfo(Date value) {
        this.expiredCertsRevocationInfo = value;
    }

    /**
     * Gets the value of the wellSigned property.
     * 
     */
    public boolean isWellSigned() {
        return wellSigned;
    }

    /**
     * Sets the value of the wellSigned property.
     * 
     */
    public void setWellSigned(boolean value) {
        this.wellSigned = value;
    }

    public List<String> getQualifiers() {
        if (qualifiers == null) {
            qualifiers = new ArrayList<String>();
        }
        return qualifiers;
    }

    public void setQualifiers(List<String> qualifiers) {
        this.qualifiers = qualifiers;
    }

    public List<String> getAdditionalServiceInfoUris() {
        if (additionalServiceInfoUris == null) {
            additionalServiceInfoUris = new ArrayList<String>();
        }
        return additionalServiceInfoUris;
    }

    public void setAdditionalServiceInfoUris(List<String> additionalServiceInfoUris) {
        this.additionalServiceInfoUris = additionalServiceInfoUris;
    }

}

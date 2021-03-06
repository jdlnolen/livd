### Background
Background
The objective of this implementation guide is to define an In Vitro Diagnostic (IVD) industry format to facilitate the publication and exchange of suggested LOINC codes for vendor IVD test assays, based on either vendor IVD test transmission codes or manual test identification, for use by laboratory personnel or laboratory applications. It is not intended to cover information for other related activities, such as purchasing tests from a vendor. Expected systems using the format include Laboratory Information Systems (LIS), clinical middleware applications, databases, and terminology servers.

This proposal will define a digital format that can be easily:

* Used as-is by IVD software systems to automate the mapping between vendor IVD test transmission codes and LOINC codes.
* Transformed into an alternate format, such as an Excel spreadsheet, to support the manual selection of LOINC codes for results produced by vendor IVD tests used by the laboratory.

Both vendor-defined IVD tests performed by a vendor IVD instrument and vendor-defined manual IVD tests are in scope.

The content uses FHIR resource profiles that can be expressed in either JSON or XML, where JSON is the minimum required format to conform to this guide.  That can then in turn be expressed for a user in a table format, such as Microsoft Excel, that further simplifies its use within a laboratory setting, or consumed into the device configurator's workbench that is part of an Laboratory Information System (LIS) or other middleware connecting devices to LIS.

By voluntarily adopting the format described here as an industry convention, IVD vendors will understand what data and in what format they should provide when publishing suggested LOINC codes for their IVD Tests. By doing so, this work will significantly reduce the variability of the content and format of the multiple publications received by laboratory environments, further reducing the time and effort required by laboratories to review and integrate this information into their laboratory software systems. The format includes additional vendor information, such as a description of the result, used to easily discriminate between multiple LOINC codes for the same IVD Test. 

Ultimately, it is expected that the LOINC codes selected by manufacturers would be reviewed by a common party (e.g. Regenstrief) for correctness and consistency across vendors, and also that the industry would establish conventions for the storage and access of the IVD vendor LOINC publications. The effort required for these objectives will also be reduced by having this standard publication format and associated content.

### Out of Scope
The implementation guide has an initial scope that does not address:

* The mapping of IVD Test Orders, which requires additional data and alignment on a standardized coding system for orders.  Although IVD Test Orders and IVD Test Results are related, information required for IVD Test Order mapping should be provided by a separate mapping table.
* The mapping of result values to LOINC and/or SNOMED.
* Any long-term or common storage locations vendors may agree upon to host the published LOINC codes or regulatory impacts of vendors providing LOINC codes for their IVD tests.
* The use of specific protocols or technologies that could be used to transmit the industry-defined digital content between IVD systems.
* Transmitting LOINC codes directly from IVD instruments, leaving that content to be represented by vendor-defined codes due to issues in achieving one-to-one appropriate LOINC codes, as discussed in the Data Definition section.
* Which LOINC codes vendors should choose for their tests, or what content is needed to make this decision. It only addresses the format used to publish these associations, for use by laboratory personnel or laboratory applications.
* What information is required to automatically set up a configuration between an IVD instrument and an IVD software system.

### Ballot

<blockquote class="stu-note">
<p>
This specification is currently undergoing ballot and connectathon testing.  It is expected to evolve, possibly significantly, as part of that process.
</p>
<p>
Feedback is welcome and may be submitted through the <a href="http://gforge.hl7.org/gf/project/fhir/tracker/?action=TrackerItemAdd&amp;tracker_id=677">FHIR gForge tracker</a>
</p>

</blockquote>

The complete content of this implementation guide can be downloaded [here](full-ig.zip).
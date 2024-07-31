# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

manu_names = ["Aratek Biometrics Co.,Ltd","Gilles Leroux Industrie","Image Match Design Inc."]
manu_names.each do |manu|
    Manufacturer.create(
        name: manu,
        email_one: "sales@aratek.co",
        phone_one: "+1234567890",
        address: "1234 Sample Street, Sample City, SC",
        desc: "BioRugged provides robust biometric solutions.",
        website_link: "https://www.aratek.co/"
    )
end

cat_names = ["Registration Devices","Authentication Devices","ABIS","SDK"]
cat_names.each do |name|
    Category.create(
        name:name,
        description:"Registration Devices Category"
    )
end


Product_names = ["Aratek IR210","CredenceTAB3","Credence-3"]
Product_names.each_with_index do |name,index|
    Product.create(
        name: name,
        short_description: "A comprehensive biometric enrolment kit with multiple modalities.",
        manufacturer_id: Manufacturer.find(index+1).id,
        model: "IR210",
        supported_biometric_modalities: "Fingerprint Slap (4-4-2), Iris (dual), Face",
        additional_components: "Battery Pack, Signature Pad, Laptop, Power Management",
        mosip_compliance_status_id: index+1,
        macp_certification_link: "",
        sbi_version: "V1.1 (Android), V2.0 (Windows)",
        global_certifications: "IP67, FBI PIV",
        full_specifications: "",
        usage: "Biometric enrolment for various applications",
        print_software_version: "",
        integration_methodology: "Various integration methods available",
        category_id: Category.find(index+1).id
    )
end

status_names = ["MOSIP Compliant", "Compliance in Progress", "MOSIP Integrated", "Integration in Progress"]
status_names.each do |name|
    MosipComplianceStatus.create(
        name:name,
        desc:""
    )
end

biometric_names = ["Fingerprint", "Iris", "Face", "Integrated"]
biometric_names.each do |name|
    Biometric.create(
        name:name,
        desc:"",
        code:name.parameterize()
    )
end

# Assigning biometric to products
Product.all.each do |p|
    p.biometrics << Biometric.find(rand(1..4))
    p.biometrics << Biometric.find(rand(1..4))
    p.save!
end
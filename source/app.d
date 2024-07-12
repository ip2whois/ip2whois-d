import std.stdio;
import ip2whois;

int main() {
	auto apiKey = "YOUR_API_KEY";
	auto domain = "locaproxy.com";
	auto whois = new IP2Whois(apiKey);
	
	auto result2 = whois.lookup(domain);
	
	if ("domain" in result2) {
		writefln("domain: %s", result2["domain"].str);
		writefln("domain_id: %s", result2["domain_id"].str);
		writefln("status: %s", result2["status"].str);
		writefln("create_date: %s", result2["create_date"].str);
		writefln("update_date: %s", result2["update_date"].str);
		writefln("expire_date: %s", result2["expire_date"].str);
		writefln("domain_age: %s", result2["domain_age"].integer);
		writefln("whois_server: %s", result2["whois_server"].str);
		writefln("nameservers: %s", result2["nameservers"]);
		
		auto registrar = result2["registrar"];
		writefln("registrar => iana_id: %s", registrar["iana_id"].str);
		writefln("registrar => name: %s", registrar["name"].str);
		writefln("registrar => url: %s", registrar["url"].str);
		
		auto registrant = result2["registrant"];
		writefln("registrant => name: %s", registrant["name"].str);
		writefln("registrant => organization: %s", registrant["organization"].str);
		writefln("registrant => street_address: %s", registrant["street_address"].str);
		writefln("registrant => city: %s", registrant["city"].str);
		writefln("registrant => region: %s", registrant["region"].str);
		writefln("registrant => zip_code: %s", registrant["zip_code"].str);
		writefln("registrant => country: %s", registrant["country"].str);
		writefln("registrant => phone: %s", registrant["phone"].str);
		writefln("registrant => fax: %s", registrant["fax"].str);
		writefln("registrant => email: %s", registrant["email"].str);
		
		auto admin = result2["admin"];
		writefln("admin => name: %s", admin["name"].str);
		writefln("admin => organization: %s", admin["organization"].str);
		writefln("admin => street_address: %s", admin["street_address"].str);
		writefln("admin => city: %s", admin["city"].str);
		writefln("admin => region: %s", admin["region"].str);
		writefln("admin => zip_code: %s", admin["zip_code"].str);
		writefln("admin => country: %s", admin["country"].str);
		writefln("admin => phone: %s", admin["phone"].str);
		writefln("admin => fax: %s", admin["fax"].str);
		writefln("admin => email: %s", admin["email"].str);
		
		auto tech = result2["tech"];
		writefln("tech => name: %s", tech["name"].str);
		writefln("tech => organization: %s", tech["organization"].str);
		writefln("tech => street_address: %s", tech["street_address"].str);
		writefln("tech => city: %s", tech["city"].str);
		writefln("tech => region: %s", tech["region"].str);
		writefln("tech => zip_code: %s", tech["zip_code"].str);
		writefln("tech => country: %s", tech["country"].str);
		writefln("tech => phone: %s", tech["phone"].str);
		writefln("tech => fax: %s", tech["fax"].str);
		writefln("tech => email: %s", tech["email"].str);
		
		auto billing = result2["billing"];
		writefln("billing => name: %s", billing["name"].str);
		writefln("billing => organization: %s", billing["organization"].str);
		writefln("billing => street_address: %s", billing["street_address"].str);
		writefln("billing => city: %s", billing["city"].str);
		writefln("billing => region: %s", billing["region"].str);
		writefln("billing => zip_code: %s", billing["zip_code"].str);
		writefln("billing => country: %s", billing["country"].str);
		writefln("billing => phone: %s", billing["phone"].str);
		writefln("billing => fax: %s", billing["fax"].str);
		writefln("billing => email: %s", billing["email"].str);
	}
	else if ("error" in result2) {
		writefln("Error: %s", result2["error"]["error_message"]);
	}
	else {
		writeln("Error: Unknown error.");
	}
	
	writefln("Punycode: %s", whois.getPunycode("täst.de"));
	writefln("NormalText: %s", whois.getNormalText("xn--tst-qla.de"));
	writefln("DomainName: %s", whois.getDomainName("https://www.example.com/exe"));
	writefln("DomainExtension: %s", whois.getDomainExtension("example.com"));
	
	return 0;
}

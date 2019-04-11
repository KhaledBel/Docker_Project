#!/bin/bash

docker-compose up -d

echo -e "\n"
echo "[*] Waiting for Nextcloud to be installed"

nextcloudStatus=$(docker-compose logs nextcloud) # Initialise nextcloudStatus
while [ ! $(echo "$nextcloudStatus" | grep "Nextcloud was successfully installed") ]
do
	echo -ne "\rWaiting.  "
	sleep 0.5
	echo -ne "\rWaiting.. "
	sleep 0.5
	echo -ne "\rWaiting..."

	nextcloudStatus=$(docker-compose logs nextcloud)
done

echo -e "\r[+] Nextcloud was successfully installed !"
#echo -e "\n"

echo -n "[*] Installation of the ldap for Nextcloud"

if [ ! -d "nextcloud/nextcloud/apps/user_ldap/" ]
then
	docker-compose exec --user www-data nextcloud php occ app:enable user_ldap
	docker-compose exec --user www-data nextcloud php occ ldap:create-empty-config
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 hasMemberOfFilterSupport 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 lastJpegPhotoLookup 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapAgentName "cn=admin,dc=projet,dc=projetdocker"
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapAgentPassword totoplop
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapBase "dc=projet,dc=projetdocker"
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapCacheTTL 600
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapConfigurationActive 1
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapExperiencedAdmin 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapExpertUUIDUserAttr uid
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapGidNumber gidNumber
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapGroupDisplayName cn
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapGroupFilterMode 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapGroupMemberAssocAttr uniqueMember
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapHost openldap
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapLoginFilter "(&(|(objectclass=posixAccount))(uid=%uid))"
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapLoginFilterEmail 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapLoginFilterMode 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapLoginFilterUsername 1
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapNestedGroups 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapPagingSize 500
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapPort 389
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapTLS 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUserAvatarRule default
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUserDisplayName cn
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUserFilter "(|(objectclass=posixAccount))"
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUserFilterMode 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUserFilterObjectclass posixAccount
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUuidGroupAttribute auto
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 ldapUuidUserAttribute auto
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 turnOffCertCheck 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 turnOnPasswordChange 0
	docker-compose exec --user www-data nextcloud php occ ldap:set-config s01 useMemberOfToDetectMembership 1
	docker-compose exec --user www-data nextcloud php occ config:app:set files cronjob_scan_files --value=500
	docker-compose exec --user www-data nextcloud php occ config:system:set ldapIgnoreNamingRules --value=false
	docker-compose exec --user www-data nextcloud php occ config:system:set ldapProviderFactory --value=OCA\\User_LDAP\\LDAPProviderFactory
	docker-compose exec --user www-data nextcloud php occ files:scan --all
fi
echo -e "\r[+] LDAP is fully configure for Nextcloud "


echo "[*] End of the script"

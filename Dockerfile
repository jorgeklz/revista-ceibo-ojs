FROM pkpofficial/ojs:3_3_0-8

# Copiar configuracion principal y reglas de proxy reverso
COPY config.inc.php /var/www/html/config.inc.php
COPY custom_patches/codespaces.conf /etc/apache2/conf.d/codespaces.conf

# Copiar parches de renderizado de citas y traducciones
COPY custom_patches/StringHelper.php /var/www/html/plugins/generic/citationStyleLanguage/lib/vendor/seboettg/citeproc-php/src/Util/StringHelper.php
COPY custom_patches/Mbstring.php /var/www/html/plugins/generic/citationStyleLanguage/lib/vendor/symfony/polyfill-mbstring/Mbstring.php
COPY custom_locale/es_ES/lib_pkp_admin.po /var/www/html/lib/pkp/locale/es_ES/admin.po
COPY custom_locale/es_ES/app_admin.po /var/www/html/locale/es_ES/admin.po

# Copiar archivos PDF de articulos publicados
COPY archivos_galeradas/contexts /var/www/files/contexts

# Configurar simulador de envio de correo para entorno academico y de practica
RUN rm -f /usr/sbin/sendmail && \
    printf '#!/bin/sh\ncat >> /var/log/mail.log\nexit 0\n' > /usr/sbin/sendmail && \
    chmod 755 /usr/sbin/sendmail && \
    touch /var/log/mail.log && \
    chmod 666 /var/log/mail.log

# Ajustar permisos
RUN chown -R apache:apache /var/www/files /var/www/html/public && \
    chmod -R 775 /var/www/files /var/www/html/public

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

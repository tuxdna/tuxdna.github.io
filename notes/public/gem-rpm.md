
# Create a gem rpm

    gem fetch mygem-version
    gem2spec mygem-version.gem > mygem.spec
    rpmbuild -ba mygem.spec
    
Create your own gem <http://guides.rubygems.org/make-your-own-gem/>

<http://fak3r.com/2009/11/18/ruby-on-rails-gem-install-versus-apt-get/>

<http://www.rpm.org/wiki/PackagerDocs/MultipleVersions>

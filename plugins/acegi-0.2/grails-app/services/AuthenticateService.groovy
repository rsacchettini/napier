/* Copyright 2006-2007 the original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import org.acegisecurity.GrantedAuthorityImpl
import org.acegisecurity.context.SecurityContextHolder as SCH
import org.springframework.util.StringUtils as STU
import org.springframework.web.servlet.support.RequestContextUtils as RCU
import org.apache.commons.codec.digest.DigestUtils as DU

import org.codehaus.groovy.grails.plugins.acegi.AuthorizeTools

/**
 * rewrote to the Groovy from Java source of
 * org.acegisecurity.taglibs.authz.AuthorizeTag
 * for to use from the controllers and a taglib.
 * 
 * @author T.Yamamoto
 */
class AuthenticateService extends AuthorizeTools {
  
  boolean transactional = true
  def acegiConfig=null
  
  /**
   * @deprecated You can invoke tags from controllers (since grails-0.6)
   */
  def ifAllGranted(role) {
    def granted = getPrincipalAuthorities()
    if (!granted.containsAll(parseAuthoritiesString(role))) {
      return false
    }else{
      return true
    }
  }

  /**
   * @deprecated You can invoke tags from controllers (since grails-0.6)
   */
  def ifNotGranted(role) {
    def granted = getPrincipalAuthorities()
    Set grantedCopy = retainAll(granted, parseAuthoritiesString(role));
    if (!grantedCopy.isEmpty()) {
      return false
    }else{
      return true
    }
  }
  
  /**
   * @deprecated You can invoke tags from controllers (since grails-0.6)
   */
  def ifAnyGranted(role) {
    def granted = getPrincipalAuthorities()
    Set grantedCopy = retainAll(granted, parseAuthoritiesString(role));
    if (grantedCopy.isEmpty()) {
      return false
    }else{
      return true
    }
  }

  def principal(){
    return SCH?.context?.authentication?.principal
  }

  def userDomain(){
    def principal = principal()
    def loginUser = null
    if( principal!=null && principal!="anonymousUser"){
      loginUser = principal?.domainClass
    }
    return loginUser
  }

  def getAcegiConfig(){
    if(this.acegiConfig==null){
      ClassLoader parent = getClass().getClassLoader()
      GroovyClassLoader loader = new GroovyClassLoader(parent)
      def ac = loader.loadClass("AcegiConfig")
      def dac = loader.loadClass("DefaultAcegiConfig")
      def _user_config = new ConfigSlurper().parse(ac)
      def _default_config = new ConfigSlurper().parse(dac)
      this.acegiConfig = _default_config.merge(_user_config)
    }
    return this.acegiConfig
  }

  /**
   * returns a MessageDigest password. 
   * (changes algorithm method dynamically by param of config)
   */
  def passwordEncoder(String passwd){
    def acegiConfig = getAcegiConfig()

    def algorithm = acegiConfig.acegi.algorithm
    def encodeHashAsBase64 = acegiConfig.acegi.encodeHashAsBase64
    def algorithmMethod = acegiConfig.algorithmMethods."${algorithm}"
    def pazzwd

    if(encodeHashAsBase64){
      pazzwd = DU."${algorithmMethod}"(passwd).getBytes().encodeBase64()
    }else{
      pazzwd = DU."${algorithmMethod}"(passwd)
    }
    return pazzwd
  }
}


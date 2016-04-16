$urlCampus

$urlUnot
$urlPnot

$urlPrimeiraInfo
$urlSegundaInfo
$urlTerceiraInfo

class Utfpr
	#Bibliotecas html nescessárias
	require 'rubygems'
	require 'hpricot'
	require 'open-uri'
	
	#função de incialização
	def initialize(url)
		@hp = Hpricot(open(url))
	end

#########################################################################
	def pegaUrlCampus
		stringCampus = @campus = @hp.at("li[@class=navTreeItem visualNoMarker navTreeFolderish section-o-campus]").inner_html
		auxCampus = stringCampus.split(/"/)
		$urlCampus = auxCampus[1]				
	end	

	def pegaUrlNoticias
		stringNome = @Not = (@hp/"div/h3").inner_html.gsub(/\n/, '')
		aux = stringNome.split(/"/)
		$urlUnot = aux [1]
		$urlPnot = aux[5]
		$urlPrimeiraInfo = aux[25]			
		$urlSegundaInfo = aux[21]
		$urlTerceiraInfo = aux[17]		
	end
#########################################################################	


	def endCompletoCampus
		@end = @hp.at("div[@id='portal-footer']").inner_text.gsub(/\n/, '')
	end


	def textoDeApresentacaoCampus
		@campus = @hp.at("div[@id='parent-fieldname-text-84bff7d47dcef80d890fe2eb7c8d20bb']").inner_text.gsub(/\n/,'') 	
	end

#######################TERCEIRA INFO####################################

	def terceiraInfoInsti
		@pInfo = @hp.at("h1[@id='parent-fieldname-title']").inner_text.gsub(/\n/, '')		
	end

	def conteudoTerceiraInfo
		@contPinfo = @hp.at("div[@id='content-core']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end


#######################SEGUNDA INFO####################################

	def segundaInfoInsti
		@pInfo = @hp.at("h1[@id='parent-fieldname-title']").inner_text.gsub(/\n/, '')		
	end

	def conteudoSegundaInfo
		@contPinfo = @hp.at("div[@id='content-core']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end

#######################PRIMEIRA INFO#####################################
	
	def primeiraInfoInsti	
		@pInfo = @hp.at("h1[@id='parent-fieldname-title']").inner_text.gsub(/\n/, '')
	end

	def conteudoPrimeiraInfo
		@contSinfo = @hp.at("div[@id='parent-fieldname-text']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end

#########################################################################
	def tituloPnot
		@pNot = @hp.at("h1[@id='parent-fieldname-title']").inner_text.gsub(/\n/, '')
	end	
	
	def textoPnot
		@textoPn = @hp.at("div[@id='parent-fieldname-description']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end
	
	def texto2Pnot
		@texto2Pn = @hp.at("div[@id='parent-fieldname-text']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end
		



#########################################################################

	def ultimaNoticia
		@pNot = (@hp/"h3/a").first.inner_text.gsub(/\n/, '')
	end

	def conteudoultimaNot
		@textoUn = @hp.at("div[@id='parent-fieldname-text']").inner_text.gsub(/\n/, ' ').gsub(/\r/, '    ')	
	end	
end

	

#############################MAIN########################################

u = Utfpr.new("http://www.utfpr.edu.br/campomourao")


########TENSTANDO#########
u.pegaUrlCampus
u.pegaUrlNoticias

p u.endCompletoCampus

campus = Utfpr.new($urlCampus)
puts campus.textoDeApresentacaoCampus

tNoticiaInfo = Utfpr.new($urlTerceiraInfo)
puts tNoticiaInfo.terceiraInfoInsti
puts tNoticiaInfo.conteudoTerceiraInfo


sNoticiaInfo = Utfpr.new($urlSegundaInfo) #instancia classe com link dinamicamente
puts sNoticiaInfo.segundaInfoInsti
puts sNoticiaInfo.conteudoSegundaInfo


tNoticiaInfo = Utfpr.new($urlPrimeiraInfo) #New na classe com o link dinâmico
puts tNoticiaInfo.primeiraInfoInsti 
puts tNoticiaInfo.conteudoPrimeiraInfo 


pNoticia = Utfpr.new ($urlPnot) #Instancia a classe com o link dinamico
puts pNoticia.tituloPnot
puts pNoticia.textoPnot #Mostra o conteudo da noticia
puts pNoticia.texto2Pnot

	
uNoticia = Utfpr.new($urlUnot)
puts u.ultimaNoticia
puts uNoticia.conteudoultimaNot


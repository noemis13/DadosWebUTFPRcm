Trab2


class Utfpr
	#Bibliotecas html nescessárias
	require 'rubygems'
	require 'hpricot'
	require 'open-uri'
	
	#função de incialização
	def initialize(url)
		@hp = Hpricot(open(url))
	end


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
	
	def penultimaNoticia	
		@pNot = @hp.at("h1[@id='parent-fieldname-title']").inner_text.gsub(/\n/, '')
	end

	def textoPnot
		@textoPn = @hp.at("div[@id='parent-fieldname-description']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end

	def texto2Pnot
		@textoPn = @hp.at("div[@id='content-core']").inner_text.gsub(/\n/, '').gsub(/\r/, '   ')
	end

#########################################################################

	def ultimaNoticia
		@pNot = (@hp/"h3/a").first.inner_text.gsub(/\n/, '')
	end
	
	def textoUnot
		@textoUn = @hp.at("div[@id='parent-fieldname-text']").inner_text.gsub(/\n/, ' ').gsub(/\r/, '   ')
	end	
	
end

#############################MAIN########################################

u = Utfpr.new("http://www.utfpr.edu.br/campomourao")

campus = Utfpr.new("http://www.utfpr.edu.br/campomourao/o-campus")

terceiraInfo = Utfpr.new("http://www.utfpr.edu.br/campomourao/estrutura-universitaria/assessorias/ascom/noticias/ultimas-noticias-1/cursos-de-formacao-de-auditor-interno-iso-9001-2015-e-de-interpretacao-da-norma-iso-9001-2015-na-utfpr-cm")

segundaInfo = Utfpr.new("http://www.utfpr.edu.br/campomourao/estrutura-universitaria/assessorias/ascom/noticias/ultimas-noticias-1/inscricoes-para-iii-fetamut")

primeiraInfo = Utfpr.new("http://www.utfpr.edu.br/campomourao/estrutura-universitaria/assessorias/ascom/noticias/ultimas-noticias-1/programa-brafitec-capes-2016")

pNoticia = Utfpr.new("http://www.utfpr.edu.br/campomourao/estrutura-universitaria/assessorias/ascom/noticias/ultimas-noticias-1/evento-internacional-no-chile")

uNoticia = Utfpr.new("http://www.utfpr.edu.br/campomourao/estrutura-universitaria/assessorias/ascom/noticias/ultimas-noticias-1/divulgacao-da-programacao-durante-visita-da-comitiva-portuguesa-ao-campus")

########TENSTANDO#########

=begin
=end
p u.endCompletoCampus
p campus.textoDeApresentacaoCampus 

p primeiraInfo.primeiraInfoInsti 
p primeiraInfo.conteudoPrimeiraInfo 

p segundaInfo.segundaInfoInsti 
p segundaInfo.conteudoSegundaInfo 

p terceiraInfo.terceiraInfoInsti 
p terceiraInfo.conteudoTerceiraInfo 

p pNoticia.penultimaNoticia
p pNoticia.textoPnot
p pNoticia.texto2Pnot

p u.ultimaNoticia
p uNoticia.textoUnot
=begin
=end

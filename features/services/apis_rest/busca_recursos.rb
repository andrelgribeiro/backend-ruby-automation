module BuscaRecursos
    class MetodosRest
      include HTTParty
      headers 'Content-Type' => 'application/json;charset=UTF-8'
      base_uri URL[NIVEL]['url_base']

      def retorna_get() # :debug_output => $stdout
        response = self.class.get(ENDPOINT['vrpat'], )
        ##print response
        response
      end

      def retorna_post(body)  # :debug_output => $stdout
        response = self.class.post(ENDPOINT['vrpat_1'], body: JSON.pretty_generate(body),  :debug_output => $stdout)
        #print response
        response
      end

      def retorna_texto_cortado(txt, array)
        array.each do |item|
         if (txt.include? item)
          txt = txt[0,(txt.index item)]
         end
        end
        txt
      end
      
    end
end
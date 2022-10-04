require 'json'
class Files
   

    def write_into_file(data , file_name )
        
        file= File.open(file_name , 'w')
    # case file_name
    #   when 'book.json'
    #     file.write(JSON.generate(self.book_hash(data)))
    #   when  'people.json'
    #     file.write(JSON.generate(self.people_hash(data)))
    #   else
    #     file.write(JSON.generate(self.rental_hash(data)))
    # end
    file.write(JSON.generate(self.book_hash(data)))
       
    end

    def book_hash(data)
       array = []
        data.each_with_object({}) do |book, hash|
           hash['title'] = book.title
           hash['author'] = book.author
           array.push(hash)
         end
         return array
    end

    def people_hash(data)
        array = []
         data.each_with_object({}) do |people, hash|
            hash['name'] = people.name
            hash['age'] = people.age
            puts people.name
            array << hash
          end

          return array
    end
       
    
end
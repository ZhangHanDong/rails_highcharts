# =======================================================
#   h = {:a=>1, :b=>{:c=>3, :d=>{:e=>4}}}               =
#   h1 = {:a=>1, :b=>{:g=>6, :d=>{:f=>5}}}              =
#   a = h.merge_recursive(h1)                           =
#   a = {:a=>1, :b=>{:c=>3, :d=>{:e=>4, :f=>5}, :g=>6}} =
# =======================================================

module HashExtend
  
  # extend the Hash class to allow for recursive merging
   def merge_recursive(hash)
     result = Marshal.load(Marshal.dump(self))

     hash.keys.each do |key|s
       if hash[key].is_a?(Hash) and self[key].is_a?(Hash)
         result[key] = result[key].deep_merge(hash[key])
         next
       end
       result[key] = hash[key]
     end

     # return the merged result hash
     result
   end

end #Hash

class Hash
  include HashExtend
end


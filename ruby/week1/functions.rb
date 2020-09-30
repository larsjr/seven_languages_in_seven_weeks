def tell_truth
    true
end

print tell_truth


def call_block(&block)
    block.call
end

def pass_block(&block)
    call_block(&block)
end
pass_block {puts 'Hello, block'}
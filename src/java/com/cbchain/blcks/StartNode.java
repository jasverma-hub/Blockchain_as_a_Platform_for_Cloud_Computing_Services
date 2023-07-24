/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cbchain.blcks;

/**
 *
 * @author Ramu Maloth
 */


import java.util.ArrayList;

/**
 *
 * @author Ramu Maloth
 */
public class StartNode {
    public static ArrayList<Block> blockchain = new ArrayList<Block>();
	public static int difficulty = 5;

    
    public ArrayList<Block> startProcess(String msg){
        
		System.out.println("Trying to Mine block 1... ");
		//addBlock(new Block("Hi im the first block", "0"));
                if(blockchain.size()==0){
                addBlock(new Block(msg,"0"));
                }else{ 
                String blk = blockchain.get(blockchain.size()-1).hash;
                addBlock(new Block(msg,blk));
                }
		//System.out.println("Trying to Mine block 2... ");
		//addBlock(new Block("Yo im the second block",blockchain.get(blockchain.size()-1).hash));
		
		//System.out.println("Trying to Mine block 3... ");
		//addBlock(new Block("Hey im the third block",blockchain.get(blockchain.size()-1).hash));	
		
		System.out.println("\nBlockchain is Valid: " + isChainValid());
		
		String blockchainJson = StringUtil.getJson(blockchain);
		System.out.println("\nThe block chain: ");
		System.out.println(blockchainJson);
                
                return blockchain;

    
    }
    public static Boolean isChainValid() {
		Block currentBlock; 
		Block previousBlock;
		String hashTarget = new String(new char[difficulty]).replace('\0', '0');
		
		//loop through blockchain to check hashes:
		for(int i=1; i < blockchain.size(); i++) {
			currentBlock = blockchain.get(i);
			previousBlock = blockchain.get(i-1);
			//compare registered hash and calculated hash:
			if(!currentBlock.hash.equals(currentBlock.calculateHash()) ){
				System.out.println("Current Hashes not equal");			
				return false;
			}
			//compare previous hash and registered previous hash
			if(!previousBlock.hash.equals(currentBlock.previousHash) ) {
				System.out.println("Previous Hashes not equal");
				return false;
			}
			//check if hash is solved
			if(!currentBlock.hash.substring( 0, difficulty).equals(hashTarget)) {
				System.out.println("This block hasn't been mined");
				return false;
			}
			
		}
		return true;
	}
	
	public static void addBlock(Block newBlock) {
		newBlock.mineBlock(difficulty);
		blockchain.add(newBlock);
	}
}

class Solution {
    public int[] solution(int n, String[] words) {
        int[] answer = {0, 0};
        for(int i = 0; i < words.length; i++){
            if(words[i].length() <= 1){ // 조건 1. 한 글자 이상이어야 한다.
                answer[0] = i % n + 1;
                answer[1] = i / n + 1;
                return answer;
            }
            
            if(i >= 1){ // 조건 2. 앞의 단어의 마지막 문자 = 현재 단어의 첫 문자
                if(words[i-1].charAt(words[i-1].length()-1) != words[i].charAt(0)){
                    answer[0] = i % n + 1;
                    answer[1] = i / n + 1;
                    return answer;
                }
            }
            
            for(int j = 0; j < i; j++){ // 조건 3. 전에 말한 단어는 또 말하면 안된다.
                if(words[i].equals(words[j])){
                    answer[0] = i % n + 1;
                    answer[1] = i / n + 1;
                    return answer;
                }
            }
        }
        return answer;
    }
}